class PagesController < ApplicationController
  def letsencrypt
    render text: "-WUcG85sUnDqFh4EPueeGN52b35zwTB675y_QxXTL3Y.vZf1dMsJMcv7m82iv-_p7rPUqaesdjs9kHpxNB27Txk"
  end
  def letsencryptwww
    render text: "l69cgQnebT68BcWlSii-k3alIcmwMgqvEOz4pRZ3kXI.vZf1dMsJMcv7m82iv-_p7rPUqaesdjs9kHpxNB27Txk"
  end
  def usernotes
    render text: Athlete.find(params[:id]).notes
  end
  def userlastseen
    begin
      render text: Athlete.find((params[:id]).to_i).treatments.order("id desc").first.date.strftime("%m/%d/%Y") + " " + Athlete.find((params[:id]).to_i).treatments.order("id desc").first.time
    rescue
      render text: " "
    end
  end
end
