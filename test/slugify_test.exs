defmodule HanTest.Slugify do
  use ExUnit.Case

  test "can slugify the chinese chanraters" do
    assert Han.slugify("长大以后的长工") == "zhang-da-yi-hou-de-chang-gong"
    assert Han.slugify("长大以后的长工", :simplified) == "zhang-da-yi-hou-de-chang-gong"
  end

  test "can slugify the tranditional chinese chanraters" do
    assert Han.slugify("長大以後的長工", :traditional) == "zhang-da-yi-hou-de-chang-gong"
  end
end
