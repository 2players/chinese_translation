simplified_sentence = """
《京华春梦》（英语：Yesterday's Glitter）是香港电视广播有限公司拍摄制作的清末民初剧集，于1980年5月26日期间首播，原定20集，后因播出时观众反映强烈增至25集，由刘松仁、汪明荃、邓碧云及鲍方领衔主演，监制王天林，外景拍摄场地景贤里。主题曲及多首插曲由顾嘉辉作曲，邓伟雄、黄霑填词，汪明荃主唱。
"""

traditional_sentence = """
《京華春夢》（英語：Yesterday's Glitter）是香港電視廣播有限公司拍攝製作的清末民初劇集，於1980年5月26日期間首播，原定20集，後因播出時觀眾反映強烈增至25集，由劉松仁、汪明荃、鄧碧雲及鮑方領銜主演，監製王天林，外景拍攝場地景賢里。主題曲及多首插曲由顧嘉輝作曲，鄧偉雄、黃霑填詞，汪明荃主唱。
"""

Benchee.run(%{
  "translate a simplified chinese character" => fn ->
    ChineseTranslation.translate("万", :simplified)
  end,
  "translate a traditional chinese character" => fn ->
    ChineseTranslation.translate("萬", :traditional)
  end,
  "translate a sentence in simplified chinese" => fn ->
    ChineseTranslation.translate(simplified_sentence, :simplified)
  end,
  "translate a sentence in traditional chinese" => fn ->
    ChineseTranslation.translate(traditional_sentence, :traditional)
  end,
  "pinyin a sentence in simplified chinese" => fn ->
    ChineseTranslation.pinyin(simplified_sentence, :simplified)
  end,
  "pinyin a sentence in traditional chinese" => fn ->
    ChineseTranslation.pinyin(traditional_sentence, :traditional)
  end,
  "slugify a sentence in simplified chinese" => fn ->
    ChineseTranslation.slugify(simplified_sentence, :simplified)
  end,
  "slugify a sentence in traditional chinese" => fn ->
    ChineseTranslation.slugify(traditional_sentence, :traditional)
  end
})
