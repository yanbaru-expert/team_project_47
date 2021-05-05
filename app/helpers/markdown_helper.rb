module MarkdownHelper
  def markdown(text)
    options = {
      filter_html: true,     # htmlを出力しない
      hard_wrap: true,     # マークダウン中の空行をhtmlに置き換え
      space_after_headers: true, # # と文字の間にスペースを要求
    }

    extensions = {
      autolink: true,  # <>で囲まれてなくてもリンクを認識
      space_after_headers: true,
      no_intra_emphasis: true,  # 単語中の強調を認識しない
      fenced_code_blocks: true,  # フェンスのあるコードブロックを認識
      strikethrough: true,  # ~ 2つで取り消し線
      tables: true,  # テーブルを認識
      hard_wrap: true,
      xhtml: true,
      lax_html_blocks: true,
      underline: true,  # 斜線(* *)
      highlight: true,  # ハイライト(== ==)
      quote: true,  # 引用符(" ")
      footnotes: true,  # 脚注( ^[1] )
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
      language = language.split(":")[0]
      case language.to_s
      when "rb"
        lang = "ruby"
      when "yml"
        lang = "yaml"
      when "css"
        lang = "css"
      when "html"
        lang = "html"
      when ""
        lang = "md"
      else
        lang = language
      end

      CodeRay.scan(code, lang).div
    end
  end
end
