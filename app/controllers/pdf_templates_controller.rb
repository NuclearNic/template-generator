class PdfTemplatesController < ApplicationController
  def index
    @pdf_templates = PdfTemplate.all
  end

  def show
    @pdf_template = PdfTemplate.find(params[:pdf_template_id])
  end

  def generate
    pdf_template = PdfTemplate.find(params[:pdf_template_id]) 
    @header = pdf_template.header
    @content = pdf_template.content

    render  pdf: 'filename.pdf',
            template: 'pdf_templates/generate.html.erb',#, :show_as_html => true
            title: pdf_template.title,
            page_size: 'A4',
            margin:  { top: 0, bottom: 0, left: 0, right: 0 },
            #  :save_to_file => Rails.root.join('tmp', "filename.pdf"), 
            # header:  {   html: {            template: 'pdf_templates/header.html.erb' },        # use :template OR :url
              # layout:   'pdf_plain',             # optional, use 'pdf_plain' for a pdf_plain.html.pdf.erb file, defaults to main layout
              # url:      'www.example.com',
              # locals:   { foo: @bar }},
            # },
            show_as_html: false, dpi: '300', save_only: false
  end
end
