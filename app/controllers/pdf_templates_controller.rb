class PdfTemplatesController < ApplicationController
  def index
    @pdf_templates = PdfTemplate.all
  end

  def show
    @pdf_template = PdfTemplate.find(params[:pdf_template_id])
  end

  def generate
    @content = 'awesome content'

    render  pdf: 'filename.pdf',
            template: 'pdf_templates/generate.html.erb',#, :show_as_html => true
            page_height: '100.0',
            page_width: '100.0',
            margin:  { top: 0, bottom: 0, left: 0, right: 0 },
            #  :save_to_file => Rails.root.join('tmp', "filename.pdf"), 
            # header:  {   html: {            template: '',          # use :template OR :url
            #   layout:   '',             # optional, use 'pdf_plain' for a pdf_plain.html.pdf.erb file, defaults to main layout
            #   url:      'www.example.com',
            #   locals:   { foo: @bar }},
            # }
            show_as_html: false, dpi: '300', save_only: false
  end
end
