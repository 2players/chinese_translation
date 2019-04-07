# Han

Utils for processing chinese.

This module provides three core functionalities related to chinese:

1. translate: translate between tranditional chinese to simplified chinese based on [Wikipedia's conversion data]("https://raw.githubusercontent.com/wikimedia/mediawiki/master/languages/data/ZhConversion.php").
2. pinyin: translate chinese words to pinyin. It is based on the data from [janx/ruby-pinyin](https://github.com/janx/ruby-pinyin).
3. slugify: slugify chinese words.

## Installation

First, add Han to your `mix.exs` dependencies:

```elixir
def deps do
  [{:han, "~> 0.2.0"}]
end
```

Then, run `$ mix deps.get` to get the dependencies.

> This module will compile over 133, 000 functions by default (compile all the 2-char phrases and 1-char chanracters). Due to this, compilation time is around 30 minutes. So be patient! You can set environment variable `MAX_WORD_LEN` to tune the compilation:

```bash
# This will compile around 40, 000 functions
$ MAX_WORD_LEN=1 mix compile
```

## Update database

This module has a built-in mix task - update database:

```bash
$ mix han.update_database
```

The downloaded file will be placed into `priv/`.

## Usage

Han is very easy to use, as follows:

### Translate

```sh
iex> Han.translate("中国")
"中國"

iex> Han.translate("中国", :simplified)
"中國"

iex> Han.translate("中國", :traditional)
"中国"
```

### Pinyin

```sh
iex> Han.pinyin("中国")
"zhōng guó"

iex> Han.pinyin("中国", :simplified)
"zhōng guó"

iex> Han.pinyin("中國", :traditional)
"zhōng guó"
```

### Slugify

```sh
iex> Han.slugify("中国")
"zhong-guo"

iex> Han.slugify("中國", :traditional)
"zhong-guo"

iex> Han.slugify(" *& 46 848 中 ----- 国")
"46-848-zhong-guo"

iex> Han.slugify("关于 Elixir 的 HTML5 页面")
"guan-yu-elixir-de-html5-ye-mian"
```

## Performance

```text
Operating System: macOS
CPU Information: Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Number of Available Cores: 12
Available memory: 16 GB
Elixir 1.8.1
Erlang 21.3.3

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
memory time: 0 ns
parallel: 1
inputs: none specified
Estimated total run time: 56 s

Name                                                  ips        average  deviation         median         99th %
translate a simplified chinese character        3242.74 K        0.31 μs  ±8355.96%           0 μs           1 μs
translate a traditional chinese character       3062.79 K        0.33 μs ±11885.74%           0 μs           1 μs
pinyin a sentence in simplified chinese           82.29 K       12.15 μs    ±58.57%          12 μs          22 μs
translate a sentence in simplified chinese        77.82 K       12.85 μs    ±38.33%          12 μs          29 μs
translate a sentence in traditional chinese       77.69 K       12.87 μs    ±51.61%          13 μs          18 μs
pinyin a sentence in traditional chinese          36.19 K       27.63 μs    ±14.74%          27 μs          36 μs
slugify a sentence in simplified chinese           5.59 K      178.85 μs     ±9.50%         176 μs         256 μs
slugify a sentence in traditional chinese          5.09 K      196.59 μs     ±6.97%         193 μs         272 μs
```

## License

[MIT](https://2players.studio/licenses/MIT) © [2Players Studio](https://2players.studio/)
