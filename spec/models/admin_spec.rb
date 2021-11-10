require 'rails_helper'

RSpec.describe Admin, type: :model do
  it "Inválido sem nome de usuário" do
    admin = Admin.new(
      password: "admin123"
    )
    expect(admin).not_to be_valid
  end
  it "Inválido sem senha" do
    admin = Admin.new(
      username: "admin"
    )
    expect(admin).not_to be_valid
  end
  it "Inválido nome de usuário indisponível" do
    admin1 = Admin.new(
      username: "admin",
      password: "admin123"
    ).save
    admin2 = Admin.new(
      username: "admin",
      password: "admin1234"
    ).save
    expect(admin1).to eq(true)
    expect(admin2).to eq(false)
  end
end
