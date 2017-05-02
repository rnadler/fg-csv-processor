require 'csv'
require 'singleton'
require_relative 'constants'

class FgCsvWriter
  include Singleton

  def initialize
    @black_list = [first_col_sym(:date), :id, :flow_gen_settings, :collect_time, :is_placeholder, :serial_number,
                   :flow_gen_ventilator_settings_id]
    @white_list = [:source, :dob, :gender, :duration_minutes, :apnea_hypopnea_index, :apnea_index, :closed_apnea_index,
                   :hypopnea_index, :open_apnea_index, :mask_leak95th_percentile, :respiratory_rate_median,
                   :therapy_mode, :is_compliant, :at_risk]
  end

  def write_csv(file_name, hashes)
    headers = get_headers(hashes)
    CSV.open(file_name, 'w', headers: headers) do |csv|
      # csv << headers # Debug
      hashes.each do |h|
        add_is_compliant(h)
        add_at_risk(h)
        csv << h.select {|k,v| include_key?(k) }.collect { |k,v| v == 'NULL' ? NULL_VALUE : v}
      end
    end
    headers.length
  end

  # Generated CSV files have binary data at the beginning of the file
  def first_col_sym(symbol)
    "#{239.chr}#{187.chr}#{191.chr}#{symbol}".force_encoding("utf-8").to_sym
  end

  private
  def include_key?(key)
    # !@black_list.include?(key.to_sym)
    @white_list.include?(key.to_sym)
  end
  def is_over_threshold(value, thresh)
    return false if value.nil? || value == 'NULL'
    value >= thresh
  end
  def get_headers(hashes)
    hashes.first.keys.select {|k| include_key?(k)} << :is_compliant << :at_risk
  end
  def add_is_compliant(hash)
    hash[:is_compliant] = is_over_threshold(hash[:duration_minutes], DURATION_THRESHOLD_MIN) ? 1 : 0
  end

  def add_at_risk(hash)
    hash[:at_risk] = is_over_threshold(hash[:apnea_hypopnea_index], AHI_THRESHOLD) ||
        is_over_threshold(hash[:mask_leak95th_percentile], LEAK_THRESHOLD/60.0)? 1 : 0
  end
end
