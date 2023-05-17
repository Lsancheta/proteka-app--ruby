module ApplicationHelper

    def link_to_add_fields(name, path, target, **options, &block)
        fields = scape_javascript(render(path, f: capture(&block)))
        link_to(name, '#', class: 'add-fields', data: {association: target, target: "#{target}-#{Time.now.to_i}", fields: fields }, **options)
    end

    def link_to_remove_fields(name, f, **options)
        f.hidden_field(:_destroy)+ link_to(name, '#', class: 'remove-fields', **options)
    end
end
