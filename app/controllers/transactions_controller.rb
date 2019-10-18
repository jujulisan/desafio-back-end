class TransactionsController < ApplicationController
  def new
  end

  def upload_file
    return render :new, status: 403 unless upload_permit[:file] && permitted_format?
    NormalizeTransaction.new(upload_permit[:file]).run

    redirect_to stores_index_url
  end

  def kind
    @kinds = KindTransaction.all
  end

  private
  def upload_permit
    params.permit(:file)
  end

  def permitted_format?
    upload_permit[:file].original_filename.last(4) == '.txt'
  end
end