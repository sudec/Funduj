<div id="search">	  
	<ul>
		<li class="backg_img">
			<?php
				$current_category="Všetko";
			if ($_GET['opt']=='project_filter' && isset($_GET['cat'])){
				foreach ($categories as $category){
					if($_GET['cat']==$category['ID']){$current_category=$category['name'];}
				}
			}else{
				$current_category="Všetko";
			}
			?>
			 Zobraziť <span class="secondary_font_color"> <?php echo $current_category;?></span>
				<ul>
					<?php
					foreach ($categories as $category){
						if ($current_category!==$category['name']){
							echo ("<a href='?opt=project_filter&cat=".$category['ID']."'><li><i class='".$category['class']."'></i> ".$category['name']."</li></a>");
						}
    				}	
					?>
				</ul>
		</li>
	</ul>
</div>	