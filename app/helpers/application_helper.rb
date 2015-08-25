module ApplicationHelper
  def add_delimiter(price)
    number_to_currency(price, separator: ",", delimiter: ".", unit: "")
  end

  def add_percentage(number)
    number_to_percentage(number, precision: 2)
  end
end
