test_that("Test unit D3mirt and plot", {
  data(anes0809offwaves)
  anes1 <- as.matrix(anes0809offwaves[,3:22])
  x <- D3mirt(anes1, modid= c("W7Q3", "W7Q20"), con.items = list(c(1:10), (11:15), c(16:20)))
  expect_s3_class(x, "D3mirt")
  expect_snapshot(x)
  expect_snapshot(print(x))
  expect_snapshot(summary(x))
  row <- as.matrix(x$dir.cos)
  row <- rowSums(row^2)
  row <- matrix(row)
  for (i in seq_along(row)){
    expect_equal(row[i,1], 1)
  }
  anes2 <- data.frame(ifelse(anes1 > 4 ,1 , 0))
  y <- D3mirt(anes2, modid= c("W7Q3", "W7Q20"), itemtype = "2PL")
  row <- as.matrix(y$dir.cos)
  row <- rowSums(row^2)
  row <- matrix(row)
  for (i in seq_along(row)){
    testthat::expect_equal(row[i,1], 1)
  }
  plot(y, title = "Plot Test 1.1")
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(y, adjust.lab = c(0.6, -0.9), font = 2, item.lab = c(1:20),
       cex = 2, title = "Plot Test 1.2", font.col = "pink", col = c("red"),
       type = "extrusion", arrow.width = 0.8, n = 22, theta = 0.3, barblen = 0.03)
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(y, item.names = FALSE, title = "Plot Test 2.1")
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(y, item.names = FALSE, adjust.lab = c(0.6, -0.9), font = 2, item.lab = c(1:20),
       cex = 2, title = "Plot Test 2.2", font.col = "pink", col = c("red"),
       type = "extrusion", arrow.width = 0.8, n = 22, theta = 0.3, barblen = 0.03)
  testthat::expect_snapshot(p)
  plot(y, items = c(1:10), title = "Plot Test 3.1")
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(y, items = c(1:10), adjust.lab = c(0.6, -0.9), font = 2, item.lab = c(1:10),
       cex = 2, title = "Plot Test 3.2", font.col = "pink", col = c("red"),
       type = "extrusion", arrow.width = 0.8, n = 22, theta = 0.3, barblen = 0.03)
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(y, item.names = FALSE, items = c(1:10), title = "Plot Test 4.1")
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(y, item.names = FALSE, items = c(1:10), adjust.lab = c(0.6, -0.9), font = 2, item.lab = c(1:10),
       cex = 2, title = "Plot Test 4.2", font.col = "pink", col = c("red"),
       type = "extrusion", arrow.width = 0.8, n = 22, theta = 0.3, barblen = 0.03)
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(y, items = c(1:10), item.lab = c(1:10), title = "Plot Test 5.1")
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(y, items = c(1:10), item.lab = c(1:10), adjust.lab = c(0.6, -0.9), font = 2,
       cex = 2, title = "Plot Test 5.2", font.col = "pink", col = c("red"),
       type = "extrusion", arrow.width = 0.8, n = 22, theta = 0.3, barblen = 0.03)
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(y, item.names = FALSE, items = c(1:10), item.lab = c(1:10), title = "Plot Test 6.1")
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(y, item.names = FALSE, items = c(1:10), item.lab = c(1:10), adjust.lab = c(0.6, -0.9), font = 2,
       cex = 2, title = "Plot Test 6.2", font.col = "pink", col = c("red"),
       type = "extrusion", arrow.width = 0.8, n = 22, theta = 0.3, barblen = 0.03)
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(x, constructs = TRUE, ind.scores = TRUE, title = "Plot Test 7.1")
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(x, constructs = TRUE, ind.scores = TRUE, adjust.lab = c(0.6, -0.9), font = 2,
       cex = 2, title = "Plot Test 7.2", font.col = "pink", col = c("red", "purple", "cyan", "green", "yellow"),
       type = "extrusion", arrow.width = 0.8, n = 22, theta = 0.3, barblen = 0.03,
       spheres.r = 0.08, sphere.col = c(rep("red", 14),
       ci = TRUE, ci.level = 0.90, ellipse.col = "grey99", ellipse.alpha = 0.40))
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(x, item.names = FALSE, title = "Plot Test 8.1")
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(x, item.names = FALSE, adjust.lab = c(0.6, -0.9), font = 2,
       cex = 2, title = "Plot Test 8.2", font.col = "pink", col = c("red", "purple", "cyan", "green", "yellow"),
       type = "extrusion", arrow.width = 0.8, n = 22, theta = 0.3, barblen = 0.03)
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(x, diff.level = 3, title = "Plot Test 9.1")
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(x, diff.level = 3, adjust.lab = c(0.6, -0.9), font = 2,
       cex = 2, title = "Plot Test 9.2", font.col = "pink", col = c("red", "purple", "cyan", "green", "yellow"),
       type = "extrusion", arrow.width = 0.8, n = 22, theta = 0.3, barblen = 0.03)
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(x, item.names = FALSE, diff.level = 3, title = "Plot Test 10.1")
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(x, item.names = FALSE, diff.level = 3, adjust.lab = c(0.6, -0.9), font = 2,
       cex = 2, title = "Plot Test 10.2", font.col = "pink", col = c("red", "purple", "cyan", "green", "yellow"),
       type = "extrusion", arrow.width = 0.8, n = 22, theta = 0.3, barblen = 0.03)
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(x,  items = c(15:20), diff.level = 1, title = "Plot Test 11.1")
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(x,  items = c(15:20), diff.level = 1, adjust.lab = c(0.6, -0.9), font = 2,
       cex = 2, title = "Plot Test 11.2", font.col = "pink", col = c("red", "purple", "cyan", "green", "yellow"),
       type = "extrusion", arrow.width = 0.8, n = 22, theta = 0.3, barblen = 0.03)
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(x, item.names = FALSE, items = c(15:20), diff.level = 1, title = "Plot Test 12.1")
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(x, item.names = FALSE, items = c(15:20), diff.level = 1, adjust.lab = c(0.6, -0.9), font = 2,
       cex = 2, title = "Plot Test 12.2", font.col = "pink", col = c("red", "purple", "cyan", "green", "yellow"),
       type = "extrusion", arrow.width = 0.8, n = 22, theta = 0.3, barblen = 0.03)
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(x, items = c(15:20), diff.level = 5, item.lab = c(1:6), title = "Plot Test 13.1", axis.scalar = 2.1, show.plane = FALSE)
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(x, items = c(15:20), diff.level = 5, item.lab = c(1:6), adjust.lab = c(0.6, -0.9), font = 2,
       cex = 2, title = "Plot Test 13.2", font.col = "pink", col = c("red", "purple", "cyan", "green", "yellow"),
       type = "extrusion", arrow.width = 0.8, n = 22, theta = 0.3, barblen = 0.03)
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(x, item.names = FALSE, items = c(15:20), diff.level = 5, item.lab = c(1:6), title = "Plot Test 14.1")
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  plot(x, item.names = FALSE, items = c(15:20), diff.level = 5, item.lab = c(1:6), adjust.lab = c(0.6, -0.9), font = 2,
       cex = 2, title = "Plot Test 14.2", font.col = "pink", col = c("red", "purple", "cyan", "green", "yellow"),
       axis.scalar = 2.1, show.plane = FALSE, type = "extrusion", arrow.width = 0.8, n = 22, theta = 0.3, barblen = 0.03)
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  anes3 <- anes0809offwaves
  z <- data.frame(cbind(x$fscores, anes3[, 1]))
  z1 <- subset(z, z[, 4] <= 30)
  plot(x, hide = TRUE, constructs = TRUE, scale = TRUE, construct.lab = c("Con 1", "Con 2", "Con 3"), adjust.lab = c(0.6, -0.9), font = 2, item.lab = c(1:20),
       cex = 2, axis.length = 4, x.lab = "A", y.lab="B", z.lab="C", title = "Plot Test 15", font.col = "pink", axis.points = "green",
       nticks = 8, plane.col = "purple", background = "black", col = c("red", "purple", "cyan", "green", "yellow"),
       type = "extrusion", arrow.width = 0.8, n = 22, theta = 0.3, barblen = 0.03,
       c.type = "extrusion", c.scalars = c(1.5,1.5),
       c.col = "cyan", c.arrow.width = 0.8, c.n = 21, c.theta = 0.3, c.barblen = 0.04,
       profiles = z1, levels = z1[, 4], spheres.r = 0.08, sphere.col = c(rep("red", 14)),
       ci = TRUE, ci.level = 0.90, ellipse.col = "grey99", ellipse.alpha = 0.40)
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  anes1 <- data.frame(anes1[,-16])
  x <- D3mirt(anes1, modid = list(c(1:10), c(15:19), c(11:14)))
  testthat::expect_snapshot(x)
  testthat::expect_snapshot(print(x))
  testthat::expect_snapshot(summary(x))
  row <- as.matrix(x$dir.cos)
  row <- rowSums(row^2)
  row <- matrix(row)
  for (i in seq_along(row)){
    testthat::expect_equal(row[i,1], 1)
  }
  plot(x, title = "Plot Test 16")
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  data("angles")
  x <- D3mirt(angles[,1:4])
  testthat::expect_snapshot(x)
  testthat::expect_snapshot(print(x))
  testthat::expect_snapshot(summary(x))
  sph <- angles[5:6]
  mdisc <- x$mdisc
  mdiff <- x$mdiff
  spherical <- x$spherical
  id <- rbind(angles[1,1:3], angles[8, 1:3], angles[9, 1:3], angles[13,1:3])
  for (i in nrow(mdisc)){
    testthat::expect_identical(mdisc[i,1], 1)
  }
  for (i in nrow(mdiff)){
    testthat::expect_identical(mdiff[i,1], -0.5)
  }
  for (i in nrow(spherical)){
    testthat::expect_identical(spherical[i,1], sph[i,1])
    testthat::expect_identical(spherical[i,2], sph[i,2])
  }
  for (i in nrow(spherical)){
    s <- D3mirt(angles[1:4], con.items = list(i))
    testthat::expect_identical(s$c.spherical[1,1], sph[i,1])
    testthat::expect_identical(s$c.spherical[1,2], sph[i,2])
  }
  for (i in nrow(angles)){
    s <- D3mirt(angles[1:4], con.sphe = list(c(sph[i,1], sph[i,2])))
    testthat::expect_equal(s$c.dir.cos[1,1], angles[i,1])
    testthat::expect_equal(s$c.dir.cos[1,2], angles[i,2])
    testthat::expect_equal(s$c.dir.cos[1,3], angles[i,3])
  }
  plot(x, title = "Plot Test 17.1")
  p <- rgl::scene3d()
  testthat::expect_snapshot(p)
  x <- D3mirt(angles[,1:4], con.sphe = con <- list(c(0, 45), c(45, 90), c(90, 45)))
  plot(x, constructs = TRUE, item.names = FALSE, construct.lab = c("Con 1", "Con 2", "Con3"), title = "Plot Test 17.2")
  testthat::expect_snapshot(x)
  testthat::expect_snapshot(print(x))
  testthat::expect_snapshot(summary(x))
})
