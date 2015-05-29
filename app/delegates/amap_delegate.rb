class AmapDelegate
  def mapView(map_view, viewForAnnotation: annotation)
    if annotation.is_a?(MAPointAnnotation)
      @annotation_view_id ||= "pointReuseIndetifier"
      annotation_view = map_view.dequeueReusableAnnotationViewWithIdentifier(@annotation_view_id)
      unless annotation_view
        annotation_view = MAPinAnnotationView.alloc.initWithAnnotation(annotation, reuseIdentifier: @annotation_view_id)
      end
      annotation_view.setCanShowCallout(true)        #设置气泡可以弹出，默认为NO
      #annotation_view.animatesDrop = true         #设置标注动画显示，默认为NO
      # #annotation_view.draggable = true            #设置标注可以拖动，默认为NO
      annotation_view.setPinColor(MAPinAnnotationColorRed)
    end
  end

  def mapView(map_view, didSelectAnnotationView: view)
    if view.is_a?(MAPinAnnotationView)
      view.setPinColor(MAPinAnnotationColorGreen)
    end
  end

  def mapView(map_view, didDeselectAnnotationView: view)
    if view.is_a?(MAPinAnnotationView)
      view.setPinColor(MAPinAnnotationColorRed)
    end
  end
end