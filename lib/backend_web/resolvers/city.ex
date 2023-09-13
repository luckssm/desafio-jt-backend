defmodule BackendWeb.Resolvers.City do
  alias Backend.Cities

  def create(%{input: params}, _context), do: Cities.Create.call(params)
  def get(%{id: city_id}, _context), do: Cities.Get.call(city_id)
  def delete(%{id: city_id}, _context), do: Cities.Delete.call(city_id)
end
