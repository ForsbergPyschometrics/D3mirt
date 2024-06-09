test_that("Test unit D3mirt", {
  data("angles")
  x <- D3mirt(angles[1:4])
  expect_s3_class(x, "D3mirt")
  sph <- angles[5:6]
  mdisc <- x$mdisc
  mdiff <- x$mdiff
  spherical <- x$spherical
  id <- rbind(angles[1,1:3], angles[8, 1:3], angles[9, 1:3], angles[13,1:3])
  h <- modid(id, efa = FALSE)
  i1 <- h$id[[1]]
  i2 <- h$id[[2]]
  expect_match(rownames(i1), "1")
  expect_match(rownames(i2), "8")
  ss <- matrix(h$ss.loadings)
  expect_equal(ss[1], 2.25)
  expect_equal(ss[2], 1)
  expect_equal(ss[3], 0.75)
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
  expect_snapshot(
    plot(x))
  data(anes0809offwaves)
  anes <- anes0809offwaves[,3:22]
  x <- D3mirt(anes, modid= c("W7Q3", "W7Q20"), con.items = list(c(1:10), (11:15), c(16:20)))
  row <- as.matrix(x$dir.cos)
  row <- rowSums(row^2)
  row <- matrix(row)
  for (i in seq_along(row)){
    expect_equal(row[i,1], 1)
  }
  expect_snapshot(x)
  expect_snapshot(plot(x))
  expect_snapshot(plot(x, item.lab = c(1:20)))
  expect_snapshot(plot(x, diff.level = 5))
  expect_snapshot(plot(x, diff.level = 5, items = c(16:20)))
  expect_snapshot(plot(x, diff.level = 5, items = c(16:20), item.lab = c(16:20)))
  expect_snapshot(plot(x, scale = TRUE))
  expect_snapshot(plot(x, scale = TRUE, item.lab = c(1:20)))
  expect_snapshot(plot(x, scale = TRUE, diff.level = 5))
  expect_snapshot(plot(x, scale = TRUE, diff.level = 5, items = c(16:20)))
  expect_snapshot(plot(x, scale = TRUE, diff.level = 5, items = c(16:20), item.lab = c(16:20)))
  expect_snapshot(plot(x, hide = TRUE))
  expect_snapshot(plot(x, constructs = TRUE))
  expect_snapshot(plot(x, constructs = TRUE, construct.lab = c(1:3)))
  expect_snapshot(plot(x, hide = TRUE, ind.scores = TRUE))
  expect_snapshot(plot(x, hide = TRUE, ind.scores = TRUE, ci = TRUE))
 # expect_equal(x$mdisc[3,1], 2.7916783)
#  expect_equal(x$mdisc[20,1], 2.0437759)
  anes <- anes[,-16]
  x <- D3mirt(anes, modid = list(c(1:10), c(15:19), c(11:14)))
  row <- as.matrix(x$dir.cos)
  row <- rowSums(row^2)
  row <- matrix(row)
  for (i in seq_along(row)){
    expect_equal(row[i,1], 1)
  }
  expect_snapshot(x)
  expect_snapshot(plot(x))
 # expect_equal(x$mdisc[13,1], 1.8247596)
 # expect_equal(x$mdisc[15,1], 0.30345643)
})

# scale = FALSE, hide = FALSE, diff.level = NULL, items = NULL, constructs = FALSE

# Testa levels
# Lägg in funktioner i package
# Kolla först om de är samma
# Testa köra riktiga tes
# Ev. utöka snapshots
# fast kod för 1/sqrt(3)
# The argument for difficulty level is too high ändra formulering

# x, scale = FALSE, hide = FALSE, diff.level = NULL, items = NULL, item.names = TRUE,  item.lab = NULL,
