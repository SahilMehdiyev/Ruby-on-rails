module Api

    class CategoriesController < ApplicationController

        def index
          @categories = Category.order(created_at: :desc)
        
          if !@categories.blank? 
            #Eger kategori bos deyilse
            render json: @categories, status: :ok
          else
            render json: @categories, status: :bad_request
          end
        end

        def show
            @category = set_category
            if !category.blank? 
               render json: @category, status: :ok
            else
                render json: @category, status: :bad_request               
            end 
        end

        def create 
          @category = Category.create(params_category)
          if category.save
            render json: @category, status: :ok
          else
            render json: 'Category Qeyd olunmadi..!', status: :bad_request
            
          end
        end

        def update
          @category = set_category
          if category.update(params_category)
            render json: @category, status: :ok
          else  
            render json: 'Category guncellenmedi..!', status: :bad_request
          end
        end


        def destroy
            category = set_category
            if category.destroy
              render json: 'Category silindi..!', status: :ok
            else
                render json: 'Category silinmedi... !!', status: :bad_request
            end
        end

           
        private

        #set_category ayri bir method olaraq tanimlayiriq ve cagiririq. 
        def set_category
            @category = Category.find(params[:id])
        end



        # permit butun datalara icaze verir. 
        def params_category 
          params.permit(:name)
        end

    end
end

