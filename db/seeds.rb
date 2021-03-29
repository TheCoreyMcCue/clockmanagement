# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ranking.destroy_all

Ranking.create(
    weekly_data: '<div id="fp-widget" data-height="100%" data-width="100%" data-thead_color="#ffffff" data-thead_font="#000000" data-t_alt_row="#fafafa" data-link_color="#3778be" data-pill_color="#2881eb" data-sport="NFL" data-wtype="preseason" data-filters="" data-scoring="STD" data-expert="3379" data-affiliate_code="" data-year="2021" data-week="0" data-auction="false" data-Notes="false" data-tags="false" data-cards="true" data-showPodcastIcons="false" data-format="table" data-promo_link="true" data-positions="ALL:QB:RB:WR:TE:DST:OP:K" data-ppr_positions="ALL:RB:WR:TE:OP" data-half_positions="ALL:RB:WR:TE:OP" data-site="" data-fd_aff="" data-dk_aff="" data-fa_aff="" data-dp_aff=""></div>
    <div class="fpw-footer"><span style="float:left"><a href="https://www.fantasypros.com/nfl/rankings/consensus-cheatsheets.php" target="_blank" rel="nofollow">2021 Fantasy Football Rankings</a> powered by FantasyPros</span><span style="float:right; text-align:right;">ECR ™ - <a href="https://www.fantasypros.com/about/faq/tools/#consensus" target="_blank" rel="nofollow">Expert Consensus Rankings</a><br>ADP - <a href="https://www.fantasypros.com/nfl/adp/" target="_blank" rel="nofollow">Average Draft Position</a></span></div><script src="//cdn.fantasypros.com/js/fp-widget-2.0.js"></script>',
    user_id: 1
)