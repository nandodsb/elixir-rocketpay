defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase

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

      {:ok, %User{id: user_id,}} = Create.call()
    end
  end
end