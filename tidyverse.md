---
layout: default
---

# Installing `tidyverse`
`tidyverse` is a collection of many different packages, authored in principal by the prolific Hadley Wickham. We will be using these packages extensively in this workshop, so it is important that `tidyverse` is installed on your machine.

1. Make sure you have completed [Installing R and RStudio](https://tim9800.github.io/r_workshop_2024/installation.html) and [Installing tools for compiling packages](https://tim9800.github.io/r_workshop_2024/compilation.html).

2. Open RStudio and run the following code in the console:
```
install.packages("tidyverse")
```

3. You will see a lot of text appear in the console. You may see the following prompt come up:
   
   ![Install from source](https://tim9800.github.io/r_workshop_2024/img/fromsource.png)
   
   Select yes

4. If you don't see any errors in the console during the installation AND something like the following appears at the end:
```
The downloaded binary packages are in
	C:\Users\your_name\AppData\Local\Temp\RtmpCywu7a\downloaded_packages
```

	then you have successfully installed `tidyverse`!