class ChargesController < ApplicationController
    def new
    end

    def create
        customer = Stripe::Customer.create(
              :email => 'example2@stripe.com',
              :card  => params[:stripeToken],
              :plan  => '1'
            )


            if customer.present?
              current_user.update_attribute(:user_level, "Member")
              current_user.update_attribute(:customer, customer.id)
              redirect_to root_path, notice: "You payment was processed successfuly, you are now a memeber "
            end

          rescue Stripe::CardError => e
            flash[:error] = e.message
            redirect_to charges_path

    end

    
     def end_plan
        flash[:error] = current_user.customer
         customer_instance = Stripe::Customer.retrieve(current_user.customer)
         if current_user.customer != nil
           customer_instance.delete
           current_user.update_attribute(:customer, nil)
           current_user.update_attribute(:user_level, "free")
           redirect_to root_path, notice: "Your plan is deleted "
          end
      end

  end
