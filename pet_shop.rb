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

def find_pet_by_name(shop,name)
  for pet in shop[:pets]
    if pet[:name] == name
      pet_name = pet
    end
  end
  return pet_name
end

def remove_pet_by_name(shop, name)
  for pet in shop[:pets]
    if pet[:name] == name
      shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(shop, new_pet)
  shop[:pets].push(new_pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, cash_spent)
  customer[:cash] -= cash_spent
end

def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] >= new_pet[:price]
    return true
  end
  return false
end

def sell_pet_to_customer(shop, pet, customer)
#  if (customer_can_afford_pet(customer, pet) true
    remove_customer_cash(customer, pet[:price])
    add_or_remove_cash(shop, pet[:price])
    increase_pets_sold(shop, pet.length)
    add_pet_to_customer(customer, pet)
    remove_pet_by_name(shop, pet)
  end
