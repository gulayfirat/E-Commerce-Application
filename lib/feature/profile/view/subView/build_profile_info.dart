part of '../profile_view.dart';

class _BuildProfileInfo extends StatelessWidget {
  const _BuildProfileInfo({required this.profileCubit});
  final ProfileCubit profileCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
                radius: 35,
                backgroundImage: (profileCubit.state.user?.image ?? "")
                    .toNetworkImageProvider)
            .pOnly(right: context.heighVal),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                (profileCubit.state.user?.firstName ?? "") +
                    " " +
                    (profileCubit.state.user?.lastName ?? ""),
                style: AppTextStyle.blackRegular16),
            Text(
              profileCubit.state.user?.email ?? "",
              style: AppTextStyle.platinumGraniteRegular14,
            ),
          ],
        )
      ],
    ).pAll(context.pageHorizontal);
  }
}
