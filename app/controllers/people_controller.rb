class PeopleController < ApplicationController

    def index
        people = Person.all
        respond_to do |format|
            format.json { render json: people, except: [:created_at, :updated_at] }
        end
    end

    def show
        person = Person.find(params[:id])
        respond_to do |format|
            format.json { render json: person, except: [:created_at, :updated_at] }
        end
    end
    
    def create
        person = Person.new(person_params)
        if person.save
            render json: {
                status: 200,
                message: 'Succesfully created person.'
            }
        else
            render json: {
                status: 500,
                message: person.errors
            }
        end
    end

    def update
        person = Person.find(params[:id])
        if person.update(person_params)
            render json: {
                status: 200,
                message: 'Succesfully updated person.'
            }
        else
            render json: {
                status: 500,
                message: person.errors
            }
        end
    end

    def destroy
        person = Person.find(params[:id])
        if person.destroy
            render json: {
                status: 200,
                message: 'Succesfully destroyed person.'
            }
        else
            render json: {
                status: 500,
                message: person.errors
            }
        end
    end

    private

    def person_params
        params.require(:person).permit(:name, :register, :birth, :bio, :photo)
    end
end
