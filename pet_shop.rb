def pet_shop_name(shop)
  return shop[:name]
end

def total_cash(shop)
  return shop[:admin][:total_cash]
end

def add_or_remove_cash(shop, cash_amount)
  shop[:admin][:total_cash] += cash_amount
end

def pets_sold(shop)
  return shop[:admin][:pets_sold]
end

def increase_pets_sold(shop, number_sold)
  shop[:admin][:pets_sold] += number_sold
end

def stock_count(shop)
  return shop[:pets].length
end

def pets_by_breed(shop, breed_name)
  breed_name_array = []
  for pet in shop[:pets]
    if pet[:breed] == breed_name
      breed_name_array.push(pet)
    end
  end
  return breed_name_array
end
