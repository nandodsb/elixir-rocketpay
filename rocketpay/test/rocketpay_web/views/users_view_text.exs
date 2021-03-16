defmodule RocketpayWeb.UsersViewTest do
  use RocketpayWeb.ConnCase, async: true 

  import Phoenix.View

  alias Rocketpay.{Account, User}
  alias RocketpayWeb.UsersView

  test "render create.json" do
     params = %{
        name: "Fernando",
        password: "123456",
        nickname: "Nando",
        email: "nando@live.com",
        age: 37
      }

      {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} = Rocketpay.create_user(params)
      
      response =  render(UsersView, "create.json", user: user)

      expected_response = %{
        message: "User created",
        user: %{
          balance: Decimal.new("0.00"),
          id: account_id
        },
        id: user_id,
        name: "Fernando",
        nickname: "Nando"
      }
  
      assert expected_response == response
  end  
end
