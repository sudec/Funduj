<div id="search">	  
	<ul>
		<li class="backg_img">
			<?php
				if (isset($_GET['stat'])){
					$status="&stat=".$_GET['stat'];
				}else{
					$status="";
				}
				$current_category="Všetko";
			if ($_GET['opt']=='project_filter' && isset($_GET['cat'])){
				foreach ($categories as $category){
					if($_GET['cat']==$category['ID']){$current_category=$category['name'];}
				}
			}else{
				$current_category="Všetko";
			}
			?>
			 Kategória <span class="secondary_font_color"> <?php echo $current_category;?></span>
				<ul>
					<?php
					foreach ($categories as $category){
						if ($current_category!==$category['name']){
							echo ("<a href='?opt=project_filter&cat=".$category['ID'].$status."'><li><i class='".$category['class']."'></i> ".$category['name']."</li></a>");
						}
    				}	
					?>
				</ul>
		</li>
	</ul>
	<?php
	if (isset($_GET['stat'])){
				if ($_GET['stat']==1){
					$current_stat = "Aktívne";
					$stat2['title']="Ukončené";
					$stat2['number']="0";
					$stat3['title']="Všetky";
					$stat3['number']="2";
				}elseif($_GET['stat']==0){
					$current_stat = "Ukončené";
					$stat2['title']="Aktívne";
					$stat2['number']="1";
					$stat3['title']="Všetky";
					$stat3['number']="2";
				}elseif($_GET['stat']==2){
					$current_stat = "Všetky";
					$stat2['title']="Aktívne";
					$stat2['number']="1";
					$stat3['title']="Ukončené";
					$stat3['number']="0";
				}
			}else{
				$current_stat = "Aktívne";
				$stat2['title']="Ukončené";
				$stat2['number']="0";
				$stat3['title']="Všetky";
				$stat3['number']="2";
			}
	if(($_GET['opt']=="project_filter")){
				$url.="?opt=".$_GET['opt']."&cat=".$_GET['cat'].'&stat=';
			}else{
				$url.='?stat=';
			}	
	?>
	<ul>
		<li class="backg_img">
			Stav: <span class="secondary_font_color"> <?php echo $current_stat;?></span>
			<ul>
				<a href=<?php echo $url.$stat2['number'];?>><li><?php echo $stat2['title']; ?></li></a>
				<a href=<?php echo $url.$stat3['number'];?>><li><?php echo $stat3['title']; ?></li></a>
			</ul>
		</li>
	</ul>
</div>	