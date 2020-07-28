module CartItemsHelper
    def customer_converting_to_jpy(price)
        "#{price.round.to_s(:delimited, delimiter: ',')}"
    end
end
