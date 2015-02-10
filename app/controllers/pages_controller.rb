class PagesController < ApplicationController
  def index
  end

  def stats
    format_annotorious_input_to_rails_convention_for_search
    text_annotations = AnnotatorStore::Annotation.where(uri: search_params[:page_url])
    image_annotations = AnnotatorStore::ImageAnnotation.where(page_url: search_params[:page_url])
    text_stats = {}
    text_annotations.each { |ta|
      text_stats[ta[:user]] = 0 if text_stats[ta[:user]].blank?
      text_stats[ta[:user]] += 1
    }
    image_stats = {}
    image_annotations.each { |ia|
      image_stats[ia[:user]] = 0 if image_stats[ia[:user]].blank?
      image_stats[ia[:user]] += 1
    }
    combined_stats = []
    text_stats.merge(image_stats){|key, oldval, newval| newval + oldval}.each { |key, value|
      combined_stats << { username: key, count: value }
    }
    render json: combined_stats
  end

  private

  def format_annotorious_input_to_rails_convention_for_search
    params[:search] = {}
    params[:search][:page_url] = params[:page_url]
  end

  def search_params
    params.require(:search).permit(:page_url)
  end
end
