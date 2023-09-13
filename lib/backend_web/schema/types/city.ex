defmodule BackendWeb.Schema.Types.City do
  use Absinthe.Schema.Notation

  object :city do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :location, non_null(:string)
  end

  input_object :create_city_input do
    field :name, non_null(:string)
    field :location, non_null(:string)
  end
end
