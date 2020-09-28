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
        { href: image_url('cotsutsumi_favi.png') },
        { href: image_url('cotsutsumi_image.png') rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: 'こつつみ',
        title: 'こつつみ',
        description: '目標／目的達成まで支出管理し、節約／我慢／積立を簡単操作で支援するサイトです',
        type: 'website',
        url: https://cotsutsumi.work,
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
end
