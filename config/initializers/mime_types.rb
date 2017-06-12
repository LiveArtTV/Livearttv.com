Mime::Type.register "application/vnd.ms-excel", :xls


@products.to_xls
@products.to_xls(:only => [:name])
