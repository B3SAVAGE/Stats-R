#basic ggplots

ggplot2::ggplot()
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

#ggplot(data = <DATA>)+
ggplot2::ggplot()
ggplot(data = mpg) +
  geom_point(mapping = aes(x =  displ, y = hwy, color = class))

#using size as a discrete variable(not recommended)
ggplot2::ggplot()
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y =hwy, size = class, color = class))

#using alpha as a discrete variable
ggplot2::ggplot()
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

#using shape as a discrete variable
ggplot2::ggplot()
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

ggplot2::ggplot()
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)

ggplot2::ggplot()
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))+
  facet_grid(drv ~ .)

ggplot2::ggplot()
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))+
  facet_grid(. ~ cyl)

ggplot2::ggplot()
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))+
  facet_wrap(~class, nrow = 2)
#geom smooth
ggplot2::ggplot()
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv, color = class))

ggplot2::ggplot()
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg)+
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg)+
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE
  )
