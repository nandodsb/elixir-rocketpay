defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase, async: true

  alias Rocketpay.User
  alias Rocketpay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "Fernando",
        password: "123456",
        nickname: "Nando",
        email: "nando@live.com",
        age: 37
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user= Repo.get(User, user_id)

      assert %User{name: "Fernando", age: 37, id: ^user_id } = user
    end

    test "when there are invalid params" do
      params = %{
        name: "Fernando",        
        nickname: "Nando",
        email: "nando@live.com",
        age: 17
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{age: ["must be greater than or equal to 18"], password: ["can't be blank"]}
      
      assert errors_on(changeset) == expected_response
      
    end
  end
end