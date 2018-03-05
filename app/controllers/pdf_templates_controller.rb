class PdfTemplatesController < ApplicationController
  def manager
    @pdf_templates = PdfTemplate.all
  end
end