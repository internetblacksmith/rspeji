# Rspeji
A rspec emoji formatter, for when you need more fun in your tests

Inspired by:
https://gist.github.com/meesterdude/6112257

with help from:
http://ieftimov.com/how-to-write-rspec-formatters-from-scratch

Install:
````
gem install rspeji
````
or add
````
gem "rspeji"
````
in your Gemfile.

once installed running rspeji from the terminal will print a list of all the available sets.

usage:
with a random emoji set:
````
rspec --format Rspeji
````

with a specific emojiset:
````
EMOJI_SPEC=cats rspec --format Rspeji
````

Available Emoji sets:

| EMOJI_SPEC | Passed | Skipped | Failed |
|------------|:------:|:-------:|:------:|
| smiley     | 😃     | 😰      | 😡    |
| heart      | 💚     | 💙      | 💔    |
| smiley2    | 😍     | 😩      | 😭 🔫    |
| hand       | 👍     | 👋      | 👎    |
| moon       | 🌝     | 🌓      | 🌚    |
| buildings  | 🏩     | 🏫      | 🏥    |
| woman      | 🙆     | 🙋      | 🙍    |
| stock      | 📈     | 📊      | 📉    |
| monkey     | 🙈     | 🙉      | 🙊    |
| cats       | 😸     | 🙀      | 😾    |
| smell      | 🌺     | 👃      | 💩    |
| fruit      | 🍏     | 🍋      | 🍎    |
| speach     | 💭     | 💬      | 🗯    |
