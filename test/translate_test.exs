defmodule HanTest.Translate do
  use ExUnit.Case
  doctest Han

  test "can translate character s->t" do
    assert Han.translate("万") == "萬"
    assert Han.translate("万", :simplified) == "萬"
  end

  test "can translate character t->s" do
    assert Han.translate("萬", :traditional) == "万"
  end

  test "can translate words s->t" do
    assert Han.translate("干线") == "幹線"
    assert Han.translate("干线", :simplified) == "幹線"
  end

  test "can translate words t->s" do
    assert Han.translate("幹線", :traditional) == "干线"
  end

  @simplified_string """
  《京华春梦》（英语：Yesterday's Glitter）是香港电视广播有限公司拍摄制作的清末民初剧集，于1980年5月26日期间首播，原定20集，后因播出时观众反映强烈增至25集，由刘松仁、汪明荃、邓碧云及鲍方领衔主演，监制王天林，外景拍摄场地景贤里。主题曲及多首插曲由顾嘉辉作曲，邓伟雄、黄霑填词，汪明荃主唱。
  """

  @traditional_string """
  《京華春夢》（英語：Yesterday's Glitter）是香港電視廣播有限公司拍攝製作的清末民初劇集，於1980年5月26日期間首播，原定20集，後因播出時觀眾反映強烈增至25集，由劉松仁、汪明荃、鄧碧雲及鮑方領銜主演，監製王天林，外景拍攝場地景賢里。主題曲及多首插曲由顧嘉輝作曲，鄧偉雄、黃霑填詞，汪明荃主唱。
  """

  test "translate a sentence s->t" do
    assert Han.translate(@simplified_string) == @traditional_string
    assert Han.translate(@simplified_string, :simplified) == @traditional_string
  end

  test "translate a sentence t->s" do
    assert Han.translate(@traditional_string, :traditional) == @simplified_string
  end
end
