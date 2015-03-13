class PagesController < ApplicationController
  def index
  end

  def stats
    # Get the text and image annotations on the page that matches the set
    # criteria i.e. the URL
    format_annotorious_input_to_rails_convention_for_search
    # text_annotations = AnnotatorStore::Annotation.where(uri: search_params[:page_url])
    # image_annotations = AnnotatorStore::ImageAnnotation.where(page_url: search_params[:page_url])
    text_annotations = AnnotatorStore::Annotation.all
    image_annotations = AnnotatorStore::ImageAnnotation.all
    text_stats = {}
    text_annotations.each { |ta|
      if text_stats[ta[:user]].blank?
        text_stats[ta[:user]] = {}
        text_stats[ta[:user]][:count]   = 0
        text_stats[ta[:user]][:upvotes] = 0
      end
      text_stats[ta[:user]][:count]   += 1
      text_stats[ta[:user]][:upvotes] += ta.upvotes.size
    }
    image_stats = {}
    image_annotations.each { |ia|
      if image_stats[ia[:user]].blank?
        image_stats[ia[:user]] = {}
        image_stats[ia[:user]][:count]   = 0
        image_stats[ia[:user]][:upvotes] = 0
      end
      image_stats[ia[:user]][:count]   += 1
      image_stats[ia[:user]][:upvotes] += ia.upvotes.size
    }
    combined_stats = []
    text_stats.merge(image_stats) { |key, oldval, newval|
      oldval.merge(newval)  { |key, ov, nv| nv + ov }
    }.each { |key, value|
      combined_stats << { username: key, count: value[:count], upvotes: value[:upvotes] }
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
