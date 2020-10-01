module ApplicationHelper
  def default_meta_tags
    {
      site: 'こつつみ',
      title: 'こつつみ',
      reverse: true,
      separator: '|',
      description: '目標／目的達成まで支出管理し、節約／我慢／積立を簡単操作で支援するサイトです',
      keywords: '目標達成,節約,支出管理,積立,簡単操作,ワンクリック',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [
        { href: image_url('cotsutsumi_favicon.png') },
        { href: image_url('cotsutsumi_image.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' }
      ],
      og: {
        site_name: 'こつつみ',
        title: 'こつつみ',
        description: '目標／目的達成まで支出管理し、節約／我慢／積立を簡単操作で支援するサイトです',
        type: 'website',
        url: request.original_url,
        image: image_url('cotsutsumi_image.png'),
        locale: 'ja_JP'
      }
      # twitter: {
      #   card: 'summary_large_image',
      #   site: '@ツイッターのアカウント名',
      # }
      # fb: {
      #   app_id: '自身のfacebookのapplication ID'
      # }
    }
  end

  def calculation_waste_purchase
    # 自分自身の無駄遣い削減合計
    calculation_waste_total

    # 全ユーザーの無駄遣い削減額
    all_user_wast_total

    # 全ユーザーの目標達成購入額
    all_user_purchase_total
  end

  def count_down_save
    @waste = Waste.find(params[:waste])
    @waste.count = @waste.count - 1
    @waste.save
    flash.now[:lose] = "今回はご褒美！"
  end

  def count_up_save
    @waste = Waste.find(params[:waste])
    @waste.count = @waste.count + 1
    @waste.save
    flash.now[:gain] = "すばらしい！！"
  end

  def calculation_waste_total
    @user_total_price = 0
    @wastes.each do |waste|
      waste_total = waste.price * waste.count
      @user_total_price+=waste_total
    end
  end

  def calculation_possible_total
    @user_difference_price = @user_total_price - @user.purchase_price
    @waste_count_all = 0
    @wastes.each do |waste|
      @waste_count_all += waste.count
    end
  end

  def all_user_wast_total
    @user_all = User.all
    @users_wastes_all = 0
    @user_all.each do |user|
      user.wastes.each do |waste|
        waste_all_total = waste.price * waste.count
        @users_wastes_all+=waste_all_total
      end
    end
  end

  def all_user_purchase_total
    @users_purchase_all = 0
    @user_all.each do |user|
      @users_purchase_all+=user.purchase_price
    end
  end
end

