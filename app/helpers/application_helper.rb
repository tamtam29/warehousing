module ApplicationHelper
  def add_delimiter(price)
    number_to_currency(price, separator: ",", delimiter: ".", unit: "")
  end
end
