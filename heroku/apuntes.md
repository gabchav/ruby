# Comandos para ubuntu

**Para entrar y salir a carpeta**
```bash
	exec bash
	exec zsh
```
**Para actualizar GitHub**
```bash
git status #Muestra los archivos no cargados
git add .  #sube los archivos no guardados pero aun no estan grabados
git commit -m "comentario"   #comentario
git push origin master  #Para subirlo a GitHub
git push heroku master  #Para subirlo al heroku
git status   #para verificar que no queden archivos por subir
```


# Crear Proyecto

```bash 
rails _6.1.5_ new my_favorite --database=postgresql
```

# Ingresar a la Carpeta

```bash
cd my_favorite
sudo service postgresql start

```

# Cambiar Puerto
Agregar siguiente linea al archivo config/database.yml
```bash
port: 5433
```

# Editar Archivo gemfile -> linea 9 
actualizar gema
```bash
gem 'pg', '~> 1.3', '>= 1.3.5'
```

# Crear Base de Datos
```bash
rails db:create db:migrate
rails g scaffold tv_show name:string summary:text release_date:datetime rating:float
```
# Iniciar Servidor en carpeta del Proyecto
```bash
rails server
```

# Agregar lo siguiente al archivo: config/routes.rb

    resources :tv_shows do
        member do
            get 'about'
        end
    end

# Crear archivo app/views/tv_shows/about.html.erb

                <h3>Acerca de:</h3>
                <p><%= @tv_show.name %></p>
                <p><%= @about %></p>
                <%= link_to 'Back', tv_shows_path %>


# Agregar link al app/views/tv_shows/index.html.erb

    <td><%= link_to 'About', about_tv_show_path(tv_show) %></td>

# Agregar acerca al controlador app/controllers/tv_shows_controller.rb

    def about
	    @about = 'Copyright 2022'
	    @tv_show = TvShow.find(params[:id])
	end

# Agregar lo siguiente al archivo: config/routes.rb

    collection do
        get 'search'
    end


# Crear archivo app/views/tv_shows/search.html.erb
          

      <%= form_with url: "/tv_shows/search", method: :get do |form| %>
            <%= form.label :query, "Buscar película o serie:" %>
            <%= form.text_field :query %>
            <%= form.submit "Buscar" %>
        <% end %>
    
        <% if @search %>
    
        <p>
            <strong>Name:</strong>
            <%= @search.name %>
        </p>
    
        <p>
            <strong>Summary:</strong>
            <%#= @search.summary %>
        </p>
    
        <p>
            <strong>Release date:</strong>
            <%= @search.release_date %>
        </p>
    
        <p>
            <strong>Rating:</strong>
            <%= @search.rating %>
        </p>
        <% else %>
        <%= "***Ningun dato encontrado***" %>
        <% end %>
    
        <%= link_to 'Back', tv_shows_path %>

# Agregar link al app/views/tv_shows/index.html.erb

    <%= link_to 'Search tv show', search_tv_shows_path %>

# Agregar busqueda al controlador app/controllers/tv_shows_controller.rb 

    def search
    @search = TvShow.find_by("name LIKE ?", "%#{ params[:query] }%")
    end

