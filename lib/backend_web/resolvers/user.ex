defmodule BackendWeb.Resolvers.User do
  alias Backend.Users

  def create(%{input: params}, _context), do: Users.Create.call(params)
  def get(%{id: user_id}, _context), do: Users.Get.call(user_id)
end
