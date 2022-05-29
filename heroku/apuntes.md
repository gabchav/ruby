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
rails _6.1.5_ new serie --database=postgresql
```

# Ingresar a la Carpeta

```bash
cd my_favorite
```

# Opcional: Iniciar postgresql
```bash
sudo service postgresql start
```

# Opcional: Cambiar Puerto
Agregar siguiente linea al archivo config/database.yml
```bash
port: 5433
```
# Abrir code
	code .
	
# Editar Archivo gemfile -> linea 9 
actualizar gema
```bash
gem 'pg', '~> 1.3', '>= 1.3.5'
```

# Crear Base de Datos
```bash
rails db:create db:migrate
rails g scaffold tv_show name:string summary:text release_date:datetime rating:float
rails db:migrate
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

# Editar Archivo gemfile 
Agregar gema paginacion
```bash
gem 'kaminari', '~> 1.2', '>= 1.2.2'
```

# Ejecutar en consola
```bash
bundle
```


# Detener y volver a iniciar el servidor
```bash
rails server
```


# Agregar lo siguiente al archivo db/seeds.rb

	puts 'creando series de tv...'

	TvShow.destroy_all

	50.times do
	    TvShow.create(
		[
		    {
			name: 'game of thrones',
			summary: 'Years after a rebellion spurred by a stolen bride to be and the blind ambitions of a mad King',
			release_date: '2011-04-17',
			rating: 7.8
		    },
		    {
			name: 'Squid Game',
			summary: 'The series revolves around Seong Gi-hun, a divorced and indebted chauffeur, who is invited to play a series of children\'s games for a chance earning a large cash prize.' ,
			release_date: '17-09-2021',
			rating: 5.6
		    },
		    {
			name: 'Angry Birds',
			summary: 'Red, an angry bird, has been an outcast from Bird Island ever since he was a hatchling due to his short temper and his huge, jet-black eyebrows.',
			release_date: '05-02-2016',
			rating: 6.1
		    },
		    {
			name: 'Jaws 2',
			summary: 'Chief Brody suspecting another great white shark is terrorizing the fictional sea side resort of Amity Island, following a series of incidents and disappearances, and his suspicions are eventually proven true.',
			release_date: '16-06-1978',
			rating: 9.8
		    },
		    {
			name: 'Agatha Christie\'s Crooked House',
			summary: 'The granddaughter of late Greek-British business tycoon Aristide Leonides, Sophia Leonides, visits private investigator Charles Hayward in his office.',
			release_date: '31-10-2017',
			rating: 8.6
		    },
		    {
			name: 'Blade Runner: The Final Cut',
			summary: 'A blade runner must pursue and terminate four replicants who stole a ship in space, and have returned to Earth to find their creator.',
			release_date: '25-06-1982',
			rating: 6.5
		    }
		]
	    )
	end

	puts 'finalizado!!!'

# Ejecutar en consola
	rails db:migrate
	rails db:seed

# Reemplazar en app/controllers/tv_shows_controller.rb
	def index
  		@tv_shows = TvShow.order(:name).page(params[:page]).per(15)
	end
	
# Agregar helper de kaminari la paginación en app/views/tv_shows/index.html.erb
	<%= paginate @tv_shows %>
	
# Para Traducir paginacion, editar archivo config/locales/en.yml
	views:
	    pagination: 
	      previous: "&lt;Anterior"
	      next: "Siguiente&gt;"
	      last: "&Uacute;ltimos"
	      first: "Primeros"

# Instalar Bootstrap
Ejecutar lo siguiente dentro del directorio del proyecto

	yarn add bootstrap@4.3.0 jquery@3.4.1 popper.js@1.16.0
	
Crear archivo: app/javascript/css/site.scss

	@import "~bootstrap/scss/bootstrap.scss";
	
Agregar lo siguiente al archivo: app/javascript/packs/application.js

	import 'css/site'
	import 'jquery'
	import 'popper.js'
	import 'bootstrap'

# Crear pagina welcome: app/views/tv_shows/welcome.html.erb

	<div class="container">
	    <div class="row">
		<div class="col-12">
		    <h1 class="display-4 text-success">My Favorite TV series</h1>
		    <p class="lead text-secondary">Welcome!!!</p>
		</div>
	    </div>
	    <hr>
	    <div class="row">
		<div class="col-12">
		    <div class="media">
			<%= image_tag('iron-man.jpg', size: "64x64", alt: "Iron Man", class: 'mr-3')%>
			<div class="media-body">
			    <h5 class="mt-0">Iron Man</h5>
			    2008's Iron Man tells the story of Tony Stark, a billionaire industrialist and genius inventor who is kidnapped and forced to build a devastating weapon. Instead, using his intelligence and ingenuity, Tony builds a high-tech suit of armor and escapes captivity.
			</div>
		    </div>
		</div>
	    </div>
	</div>

# Agregar ruta en archivo: config/routes.rb

	Rails.application.routes.draw do
	  get '/tv_shows', to: 'tv_shows#index'
	  get '/welcome', to: 'tv_shows#welcome'
	  root 'tv_shows#welcome'
	  resources :tv_shows do
	    collection do
	      get 'search'
	    end
	    member do
	      get 'about'
	    end
	    end
	  end

# Agregar ruta de imágen
Agregar columna: ruta_img en base de datos (con pg_admin)

Agregar en app/views/tv_shows/_form.html.erb

 	<div class="field">
	<%= form.label :'Ruta imágen' %>
	<%= form.text_field :ruta_img %>
	</div>
	
Agregar en app/controllers/tv_shows_controller.rb

	    def tv_show_params
	      params.require(:tv_show).permit(:name, :summary, :release_date, :rating, :ruta_img)
	    end
