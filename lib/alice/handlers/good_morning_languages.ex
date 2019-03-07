defmodule Alice.Handlers.GoodMorningLanguages do
  @moduledoc """
  This handler will allow Alice to say good morning to people in different languages.

  It does so only once each morning.
  """
  use Alice.Router
  require Logger

  @good_morning_regex ~r/good morning|mirëmëngjes|egun on|добрай раніцы|dobray ranici|dobro jutro|добро утро|dobro utro|bon dia|dobro jutro|dobré ráno|godmorgen|goedemorgen|tere hommikust|huomenta|bonjour|bos días|guten morgen|καλημέρα|kaliméra|jó reggelt|góðan dag|buongiorno|labrīt|labas rytas|добро утро|dobro utro|bongu|god morgen|dzień dobry|bom dia|bună dimineața|доброе утро|dobro utro|добро јутро|dobro utro|buenos días|god morgon|добрий ранок|dobre rano|bore da|אַ גוטנ מאָרג|gut margn|goeie more|za asubuhi|sawubona|շնորհակալություն|chnorakaloutioun|早晨|jóusàhn|सुप्रभात|namaste|おはようございます|ohayōgozaimasu|annyeong hashimnikka|selamat pagi|早上好|zǎoshang hǎo|өглөөний мэнд|காலை வணக்கம்|kālai vaṇakkam|อรุณสวัสดิ์ |sawùt dee krúp\/kâ|chào buổi sáng|صباح الخير|sabah alkhyr|salam|günaydın/i

  route(@good_morning_regex, :good_morning)
  command(@good_morning_regex, :good_morning)
  command(~r/morning language/, :good_morning_language)

  @good_mornings [
    %{text: "Good morning"},
    %{language: "Albanian", text: "Mirëmëngjes", regex: "Mirëmëngjes"},
    %{language: "Bascue", text: "Egun on", regex: "Egun on"},
    %{
      language: "Belarusian",
      text: "Добрай раніцы (Dobray ranici)",
      regex: "Добрай раніцы|Dobray ranici"
    },
    %{language: "Bosnian", text: "Dobro jutro", regex: "Dobro jutro"},
    %{language: "Bulgarian", text: "Добро утро (Dobro utro)", regex: "Добро утро|Dobro utro"},
    %{language: "Catalan", text: "Bon dia", regex: "Bon dia"},
    %{language: "Croatian", text: "Dobro jutro", regex: "Dobro jutro"},
    %{language: "Czech", text: "Dobré ráno", regex: "Dobré ráno"},
    %{language: "Danish", text: "Godmorgen", regex: "Godmorgen"},
    %{language: "Dutch", text: "Goedemorgen", regex: "Goedemorgen"},
    %{language: "Estonian", text: "Tere hommikust", regex: "Tere hommikust"},
    %{language: "Finnish", text: "Huomenta", regex: "Huomenta"},
    %{language: "French", text: "Bonjour", regex: "Bonjour"},
    %{language: "Galician", text: "Bos días", regex: "Bos días"},
    %{language: "German", text: "Guten Morgen", regex: "Guten Morgen"},
    %{language: "Greek", text: "Καλημέρα (Kaliméra)", regex: "Καλημέρα|Kaliméra"},
    %{language: "Hungarian", text: "Jó reggelt", regex: "Jó reggelt"},
    %{language: "Icelandic", text: "Góðan dag", regex: "Góðan dag"},
    %{language: "Italian", text: "Buongiorno", regex: "Buongiorno"},
    %{language: "Latvian", text: "Labrīt", regex: "Labrīt"},
    %{language: "Lithuanian", text: "Labas rytas", regex: "Labas rytas"},
    %{language: "Macedonian", text: "Добро утро (Dobro utro)", regex: "Добро утро|Dobro utro"},
    %{language: "Maltese", text: "Bongu", regex: "Bongu"},
    %{language: "Norwegian", text: "God morgen", regex: "God morgen"},
    %{language: "Polish", text: "Dzień dobry", regex: "Dzień dobry"},
    %{language: "Portuguese", text: "Bom dia", regex: "Bom dia"},
    %{language: "Romanian", text: "Bună dimineața", regex: "Bună dimineața"},
    %{language: "Russian", text: "Доброе утро (Dobro utro)", regex: "Доброе утро|Dobro utro"},
    %{language: "Serbian", text: "Добро јутро (Dobro utro)", regex: "Добро јутро|Dobro utro"},
    %{language: "Spanish", text: "Buenos días", regex: "Buenos días"},
    %{language: "Swedish", text: "God morgon", regex: "God morgon"},
    %{language: "Ukrainian", text: "Добрий ранок (Dobre rano)", regex: "Добрий ранок|Dobre rano"},
    %{language: "Welsh", text: "Bore da", regex: "Bore da"},
    %{language: "Yiddish", text: "אַ גוטנ מאָרג (Gut margn)", regex: "אַ גוטנ מאָרג|Gut margn"},
    %{language: "Afrikaans", text: "Goeie more", regex: "Goeie more"},
    %{language: "Swahili", text: "za asubuhi", regex: "za asubuhi"},
    %{language: "Zulu", text: "Sawubona", regex: "Sawubona"},
    %{
      language: "Armenian",
      text: "Շնորհակալություն (Chnorakaloutioun)",
      regex: "Շնորհակալություն|Chnorakaloutioun"
    },
    %{language: "Cantonese", text: "早晨 (Jóusàhn)", regex: "早晨|Jóusàhn"},
    %{language: "Hindi", text: "सुप्रभात (Namaste)", regex: "सुप्रभात|Namaste"},
    %{
      language: "Japanese",
      text: "おはようございます (Ohayōgozaimasu)",
      regex: "おはようございます|Ohayōgozaimasu"
    },
    %{language: "Korean", text: "(annyeong hashimnikka)", regex: "annyeong hashimnikka"},
    %{language: "Malay", text: "Selamat Pagi", regex: "Selamat Pagi"},
    %{language: "Mandarin", text: "早上好 (Zǎoshang hǎo)", regex: "早上好|Zǎoshang hǎo"},
    %{language: "Mongolian", text: "Өглөөний мэнд", regex: "Өглөөний мэнд"},
    %{language: "Tamil", text: "காலை வணக்கம் (Kālai vaṇakkam)", regex: "காலை வணக்கம்|Kālai vaṇakkam"},
    %{language: "Thai", text: "อรุณสวัสดิ์ (Sawùt dee krúp/kâ)", regex: "อรุณสวัสดิ์ |Sawùt dee krúp/kâ"},
    %{language: "Vietnamese", text: "Chào buổi sáng", regex: "Chào buổi sáng"},
    %{language: "Arabic", text: "صباح الخير (Sabah alkhyr)", regex: "صباح الخير|Sabah alkhyr"},
    %{language: "Farsi", text: "Salam", regex: "Salam"},
    %{language: "Turkish", text: "Günaydın", regex: "Günaydın"}
  ]

  # Helpful to generate regex
  # def generate_regex_match do
  #   for %{regex: regex} <- @good_mornings do
  #     String.downcase(regex)
  #   end
  #   |> Enum.join("|")
  #   |> Regex.compile()
  #   |> elem(1)
  # end

  @doc """
  Say good morning to Alice in many different languages and she will respond
  with a "good morning" in a different language.
  """
  def good_morning(conn) do
    with today <- DateTime.to_date(DateTime.utc_now()),
         :gt <- Date.compare(today, last_good_morning(conn)) do
      good_morning =
        @good_mornings
        |> Enum.random()

      good_morning
      |> format_message()
      |> reply(conn)

      update_last_good_morning(conn, good_morning)
    else
      _ ->
        Logger.info("We already said good morning on #{last_good_morning(conn)}")
        conn
    end
  end

  @doc """
  Returns the language of the last good morning alice said
  """
  def good_morning_language(conn) do
    conn
    |> get_state(:last_good_morning_language)
    |> format_message()
    |> reply(conn)
  end

  defp update_last_good_morning(conn, %{language: language}) do
    date = DateTime.to_date(DateTime.utc_now())

    conn
    |> put_state(:last_good_morning, date)
    |> put_state(:last_good_morning_language, language)
  end

  defp last_good_morning(conn) do
    default =
      DateTime.utc_now()
      |> DateTime.to_date()
      |> Date.add(-1)
      |> to_string()

    conn
    |> get_state(:last_good_morning, default)
    |> Date.from_iso8601!()
  end

  defp format_message(%{text: text}) do
    "#{text}!"
  end

  defp format_message(language) do
    "Today's good morning was in #{language}\nhttps://en.wikipedia.org/wiki/#{language}_language"
  end
end