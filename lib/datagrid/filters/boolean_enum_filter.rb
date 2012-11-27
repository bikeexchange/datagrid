class Datagrid::Filters::BooleanEnumFilter < Datagrid::Filters::EnumFilter

  YES = "YES"
  NO = "NO"

  def initialize(report, attribute, options = {}, &block)
    options[:allow_blank] = true
    options[:allow_nil] = false
    options[:select] = [YES, NO].map do |key, value|
      [I18n.t("datagrid.filters.eboolean.#{key.downcase}", :default => key.humanize), key == 'YES' ? true : false]
    end
    super(report, attribute, options, &block)
  end

  def apply(grid_object, scope, value)
    super(grid_object, scope, value)
  end

  def to_boolean(value)
    #TODO decide what to do with conversion
    value.blank? ? nil : value
  end

end
