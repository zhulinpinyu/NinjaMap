class AmapDelegate
  def mapView(map_view,viewForAnnotation: annotation)
    @annotation_view_id ||= "pointReuseIndetifier"
    annotation_view = map_view.dequeueReusableAnnotationViewWithIdentifier(@annotation_view_id)
    unless annotation_view
      annotation_view = MAPinAnnotationView.alloc.initWithAnnotation(annotation, reuseIdentifier: @annotation_view_id)
    end
    annotation_view.setCanShowCallout(true)        #设置气泡可以弹出，默认为NO
    #annotation_view.animatesDrop = true         #设置标注动画显示，默认为NO
    # #annotation_view.draggable = true            #设置标注可以拖动，默认为NO
    annotation_view.setPinColor(MAPinAnnotationColorGreen)
  end
end