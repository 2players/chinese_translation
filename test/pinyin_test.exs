defmodule HanTest.Pinyin do
  use ExUnit.Case

  test "can translate chinese into pinyin" do
    assert Han.pinyin("铸模") == "zhù mó"
    assert Han.pinyin("铸模", :simplified) == "zhù mó"
  end

  test "can translate traditional chinese into pinyin" do
    assert Han.pinyin("幹線", :traditional) == "gàn xiàn"
  end

  test "can translate character with multiple pronouciation to pinyin" do
    assert Han.pinyin("长大以后的长工") == "zhǎng dà yǐ hòu de cháng gōng"
    assert Han.pinyin("长大以后的长工", :simplified) == "zhǎng dà yǐ hòu de cháng gōng"
  end
end
