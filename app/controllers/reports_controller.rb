# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :current_report, only: %i[edit update destroy]

  # GET /reports
  def index
    @reports = Report.all
  end

  # GET /reports/1
  def show
    @report = Report.find(params[:id])
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit; end

  # POST /reports
  def create
    @report = current_user.reports.build(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to report_url(@report), notice: t('controllers.common.notice_create', name: '日報') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to report_url(@report), notice: t('controllers.common.notice_update', name: '日報') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  def destroy
    @report.destroy

    respond_to do |format|
      format.html { redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: '日報') }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def report_params
    params.require(:report).permit(:title, :memo)
  end

  def current_report
    @report = current_user.reports.find_by(id: params[:id])
    redirect_to reports_path if @report.nil?
  end
end
