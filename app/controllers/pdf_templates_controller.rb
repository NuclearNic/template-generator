# it does what it says man
class PdfTemplatesController < ApplicationController
  before_action :get_template_elements

  def index
    @pdf_templates = PdfTemplate.all
  end

  def show
    @pdf_template = PdfTemplate.find(params[:pdf_template_id])
  end

  def pdfkit_generate
    html = render_to_string(:action => 'pdfkit/content.html.erb', :layout => false)
    pdf = PDFKit.new(html)
    # send_data pdf.to_pdf,
    send_data pdf.to_pdf,
                type: 'application/pdf',
                disposition: 'inline' # either "inline" or "attachment"
    # send_data(pdf.to_pdf)
  end

  def prawn_generate
    pdf = Prawn::Document.new
    pdf.text 'Hello World'
    send_data pdf.render, 
          type: 'application/pdf',
          disposition: 'inline'
  end

  def wicked_generate
    render  pdf: 'filename.pdf',
            template: 'pdf_templates/wicked/content.html.erb',#, :show_as_html => true
            title: @pdf_template.title,
            page_size: 'A4',
            margin:  { top: 0, bottom: 15, left: 0, right: 0 },
            show_as_html: false, dpi: '300', save_only: false,
            footer:  {
              html: {
                template: 'pdf_templates/wicked/footer.html.erb'
              }
            }
  end

  private

  def get_template_elements
    @pdf_template = PdfTemplate.find(params[:pdf_template_id])
    @header = @pdf_template.header
    @content = add_date(@pdf_template.content)
    @footer = @pdf_template.footer ? add_page_number(@pdf_template.footer) : ''
  end

  def add_page_number(footer)
    footer
      .gsub('page_number', '<span class="page"></span>')
      .gsub('total_pages', '<span class="topage"></span>')
  end

  def add_date(content)
    content.gsub('date_today', Date.today.to_s)
  end
end
