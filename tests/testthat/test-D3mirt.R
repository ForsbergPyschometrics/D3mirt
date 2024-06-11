test_that("Test unit D3mirt and plot", {
  data("angles")
  x <- D3mirt(angles[1:4])
  expect_s3_class(x, "D3mirt")
  expect_snapshot(x)
  expect_snapshot(summary(x))
  sph <- angles[5:6]
  mdisc <- x$mdisc
  mdiff <- x$mdiff
  spherical <- x$spherical
  id <- rbind(angles[1,1:3], angles[8, 1:3], angles[9, 1:3], angles[13,1:3])
  for (i in nrow(mdisc)){
    expect_identical(mdisc[i,1], 1)
  }
  for (i in nrow(mdiff)){
    expect_identical(mdiff[i,1], -0.5)
  }
  for (i in nrow(spherical)){
    expect_identical(spherical[i,1], sph[i,1])
    expect_identical(spherical[i,2], sph[i,2])
  }
  for (i in nrow(spherical)){
    s <- D3mirt(angles[1:4], con.items = list(i))
    expect_identical(s$c.spherical[1,1], sph[i,1])
    expect_identical(s$c.spherical[1,2], sph[i,2])
  }
  for (i in nrow(angles)){
    s <- D3mirt(angles[1:4], con.sph = list(c(sph[i,1], sph[i,2])))
    expect_equal(s$c.dir.cos[1,1], angles[i,1])
    expect_equal(s$c.dir.cos[1,2], angles[i,2])
    expect_equal(s$c.dir.cos[1,3], angles[i,3])
  }
  data(anes0809offwaves)
  anes <- anes0809offwaves[,3:22]
  x <- D3mirt(anes, modid= c("W7Q3", "W7Q20"), con.items = list(c(1:10), (11:15), c(16:20)))
  expect_snapshot(x)
  expect_snapshot(summary(x))
  row <- as.matrix(x$dir.cos)
  row <- rowSums(row^2)
  row <- matrix(row)
  for (i in seq_along(row)){
    expect_equal(row[i,1], 1)
  }
  anes <- anes[,-16]
  x <- D3mirt(anes, modid = list(c(1:10), c(15:19), c(11:14)))
  expect_snapshot(x)
  expect_snapshot(summary(x))
  row <- as.matrix(x$dir.cos)
  row <- rowSums(row^2)
  row <- matrix(row)
  for (i in seq_along(row)){
    expect_equal(row[i,1], 1)
  }
})
