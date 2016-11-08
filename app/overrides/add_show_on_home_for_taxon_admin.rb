Deface::Override.new(virtual_path:  'spree/admin/taxons/_form',
                     name:          'add_show_on_home_taxon_form',
                     insert_bottom: '[data-hook="admin_inside_taxon_form"]',
                     partial:       'spree/admin/shared/show_on_home_taxon_form',
                     disabled:      false)
