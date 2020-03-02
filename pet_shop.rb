# returns shop name
def pet_shop_name(shop)
  return shop[:name]
end

#returns the amount of money in the shop
def total_cash(shop)
  return shop[:admin][:total_cash]
end

#adds money to shop
def add_or_remove_cash(shop, cash_amount)
  shop[:admin][:total_cash] += cash_amount
end

#returns number of pets sold
def pets_sold(shop)
  return shop[:admin][:pets_sold]
end

#adds sold pets to total pets sold
def increase_pets_sold(shop, number_sold)
  shop[:admin][:pets_sold] += number_sold
end

#returns number of pets in shop
def stock_count(shop)
  return shop[:pets].length
end

#returns all pets of specific breed
def pets_by_breed(shop, breed_name)
  breed_name_array = []
  for pet in shop[:pets]
    if pet[:breed] == breed_name
      breed_name_array.push(pet)
    end
  end
  return breed_name_array
end

#returns pet (hash) if name argument == pet name
def find_pet_by_name(shop,name)
  pet_name = nil  ##sets pet_name to nil to ensure nil is returned if pet name is not found. (Ruby will return nil anyway if not found, but good practice to ensure it's correct)
  for pet in shop[:pets]
    if pet[:name] == name
      pet_name = pet
    end
  end
  return pet_name
end

#removes sold pets
def remove_pet_by_name(shop, name)
  for pet in shop[:pets]
    if pet[:name] == name
      shop[:pets].delete(pet)
    end
  end
end

# adds new pets to shop stock
def add_pet_to_stock(shop, new_pet)
  shop[:pets].push(new_pet)
end

#returns the amount of cash a customer has
def customer_cash(customer)
  return customer[:cash]
end

#reduces customer cash
def remove_customer_cash(customer, cash_spent)
  customer[:cash] -= cash_spent
end

#counts number of pets a customer has
def customer_pet_count(customer)
  return customer[:pets].length
end

#adds new pet to customer
def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

#checks if customer can afford a pet
def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] >= new_pet[:price]
    return true
  end
  return false
end

#Combines functions to exchange money, add pet to customer, remove pet from shop if the customer has enough money and the pet exists.
def sell_pet_to_customer(shop, pet, customer)
  for animal in shop[:pets]
    if animal == pet && customer_can_afford_pet(customer, pet) == true
    remove_customer_cash(customer, pet[:price])
    add_or_remove_cash(shop, pet[:price])
    increase_pets_sold(shop,1)
    add_pet_to_customer(customer, pet)
    remove_pet_by_name(shop, pet)
    end
  end
end

def add_pet_to_shop(shop)
  new_pet = {}
  p "Name of pet:"
  name = gets.chomp
  p "Pet type:"
  type = gets.chomp.to_sym()
  p "Pet breed:"
  breed = gets.chomp
  p "Pet price:"
  price = gets.chomp.to_i()
  new_pet[:name] = name
  new_pet[:type] = type
  new_pet[:breed] = breed
  new_pet[:price] = price
  shop[:pets].push(new_pet)
end
