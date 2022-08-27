class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @customers = Customer.all
    @contact = Contact.new
    @mail_order = MailOrder.new
  end

  def brindos_lac_et_chateau
    @brindos_customers = BrindosCustomer.all
    @brindos_room_customers = BrindosRoomCustomer.all
    @brindos_restaurant_customers = BrindosRestaurantCustomer.all
    @brindos_spa_customers = BrindosSpaCustomer.all
    @brindos_pro_customers = BrindosProCustomer.all
  end

  def cocorico
    @porto_customers = PortoCustomer.all
    @porto_room_customers = PortoRoomCustomer.all
    @porto_restaurant_customers = PortoRestaurantCustomer.all
  end

  def la_plage_blanche
    @theoule_customers = TheouleCustomer.all
    @theoule_beach_customers = TheouleBeachCustomer.all
    @theoule_restaurant_customers = TheouleRestaurantCustomer.all
    @theoule_spa_customers = TheouleSpaCustomer.all
  end

  def le_chateau_de_sacy
    @sacy_customers = SacyCustomer.all
    @sacy_room_customers = SacyRoomCustomer.all
    @sacy_restaurant_customers = SacyRestaurantCustomer.all
    @sacy_spa_customers = SacySpaCustomer.all
    @sacy_pro_customers = SacyProCustomer.all
  end

  def le_domaine_de_raba
    @raba_customers = RabaCustomer.all
    @raba_room_customers = RabaRoomCustomer.all
    @raba_restaurant_customers = RabaRestaurantCustomer.all
    @raba_spa_customers = RabaSpaCustomer.all
    @raba_pro_customers = RabaProCustomer.all
  end

  def le_grand_hotel_du_soleil_d_or
    @megeve_customers = MegeveCustomer.all
    @megeve_room_customers = MegeveRoomCustomer.all
    @megeve_restaurant_customers = MegeveRestaurantCustomer.all
    @ghso_spa_customers = GhsoSpaCustomer.all
  end

  def le_manege
    @leognan_customers = LeognanCustomer.all
    @leognan_restaurant_customers = LeognanRestaurantCustomer.all
    @leognan_pro_customers = LeognanProCustomer.all
  end
end
