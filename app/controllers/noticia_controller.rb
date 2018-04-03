class NoticiaController < ApplicationController
  before_action :set_noticium, only: [:show, :edit, :update, :destroy, :eliminar_comentario, :comentar, :mostrar_comentarios]

  # GET /noticia
  # GET /noticia.json
  def index
    @noticia = Noticium.all.order(:created_at).reverse_order
    r = []
    @noticia.each do |noticium|
      h = {id: noticium.id,
        title: noticium.titular,
        subtitle: noticium.bajada,  
        body: noticium.cuerpo.truncate(503),
        created_at: noticium.created_at
      }
      r.push(h)
    
    end
    render json: r, status: :ok, content_type: 'application/json'
  end

  def comentar
    h = {
      contenido: params[:comment],
      noticium: @noticia,
      nombre: params[:author]
    }
    @comentario = Comentario.create(h)
    if @comentario.save
      h_prima = {id: @comentario.id,
        author: @comentario.nombre,
        comment: @comentario.contenido,
        created_at: @comentario.created_at
      }
      render json: h_prima, status: :created
    else
        render json: @comentario.errors, status: :unprocessable_entity
    end
  end

  def eliminar_comentario
    comentario = Comentario.find(params[:c_id])
    h = {id: comentario.id,
        author: comentario.nombre,
        comment: comentario.contenido,  
        created_at: comentario.created_at
    }
    comentario.destroy
    render json: h, status: :ok
  end

  def mostrar_comentarios
    @comentarios = @noticia.comentarios
    r = []
    @comentarios.each do |comentario|
      h = {id: comentario.id,
        author: comentario.nombre,
        comment: comentario.contenido,  
        created_at: comentario.created_at
      }
      r.push(h)
    end
    render json: r, status: :ok, content_type: 'application/json'
  end

  def mostrar_comentario
    comentario = Comentario.find(params[:c_id])
    h = {id: comentario.id,
        author: comentario.nombre,
        comment: comentario.contenido,  
        created_at: comentario.created_at
    }
    render json: h, status: :ok, content_type: 'application/json'
  end


  # GET /noticia/1
  # GET /noticia/1.json
  def show
    if @noticia
      h = {id: @noticia.id,
        title: @noticia.titular,
        subtitle: @noticia.bajada,  
        body: @noticia.cuerpo,
        created_at: @noticia.created_at
      }
      render json: h, status: :ok
    else
      render status: :not_found
    end

  end

  # GET /noticia/new
  def new
    @noticium = Noticium.new
  end

  # GET /noticia/1/edit
  def edit
  end

  # POST /noticia
  # POST /noticia.json
  def create

    h = {fecha: Date.today, 
      cuerpo: params[:body], 
      bajada: params[:subtitle], 
      titular: params[:title]
    }

    @noticium = Noticium.new(h)

    
    if @noticium.save
      res = {id: @noticium.id,
        title: @noticium.titular,
        subtitle: @noticium.bajada,  
        body: @noticium.cuerpo,
        created_at: @noticium.fecha
      }
      render json: res, status: :created
    end
  end

  # PATCH/PUT /noticia/1
  # PATCH/PUT /noticia/1.json
  def update
    respond_to do |format|
      h = {
        cuerpo: noticium_params[:cuerpo],
        bajada: noticium_params[:bajada],
        titular: noticium_params[:titular]
      }
      if @noticium.update(h)
        format.html { redirect_to @noticium, notice: 'Noticium was successfully updated.' }
        format.json { render :show, status: :ok, location: @noticium }
      else
        format.html { render :edit }
        format.json { render json: @noticium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /noticia/1
  # DELETE /noticia/1.json
  def destroy
    h = {id: @noticia.id,
        title: @noticia.titular,
        subtitle: @noticia.bajada,  
        body: @noticia.cuerpo,
        created_at: @noticia.created_at
    }
    @noticia.destroy
    render json: h, status: :ok
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_noticium
      @noticia = Noticium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def noticium_params
      params.require(:noticium).permit(:cuerpo, :bajada, :titular)
    end


end
